"""Lambda trigger handler for Scientist Self-Serve API Gateway + EventBridge promotion."""

import json
from typing import Dict, Any

def lambda_handler(event: Dict[str, Any], context: Any) -> Dict[str, Any]:
    """Handles promotion and on-demand model training requests."""
    body = {}
    if "body" in event and event["body"]:
        body = json.loads(event["body"]) if isinstance(event["body"], str) else event["body"]

    action = body.get("action", "START_TRAINING")
    environment = body.get("environment", "homolog")
    model_version = body.get("model_version", "v1.2.0")

    if action == "PROMOTE_MODEL":
        response_payload = {
            "status": "PROMOTED",
            "model_version": model_version,
            "target_environment": environment,
            "event_emitted": "custom.abalone.mlops.ModelPromoted"
        }
        status_code = 200
    else:
        response_payload = {
            "status": "BATCH_TRAINING_TRIGGERED",
            "execution_arn": f"arn:aws:states:us-east-1:123456789012:execution:abalone-distributed-batch-pipeline:{model_version}",
            "partitions": 50,
            "target_environment": environment
        }
        status_code = 202

    return {
        "statusCode": status_code,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps(response_payload)
    }
