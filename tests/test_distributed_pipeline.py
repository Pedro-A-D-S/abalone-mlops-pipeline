import pytest
from abalone_pipeline.train_partition import train_partition
from abalone_pipeline.self_serve_handler import lambda_handler

def test_batch_array_partition_training():
    res = train_partition(partition_index=4, total_partitions=50)
    assert res.status == "SUCCESS"
    assert res.partition_id == 4
    assert res.r2_score > 0.80

def test_self_serve_lambda_start_training():
    event = {
        "body": '{"action": "START_TRAINING", "environment": "homolog", "model_version": "v2.0.0"}'
    }
    resp = lambda_handler(event, None)
    assert resp["statusCode"] == 202
    assert "abalone-distributed-batch-pipeline" in resp["body"]

def test_self_serve_lambda_promote_model():
    event = {
        "body": '{"action": "PROMOTE_MODEL", "environment": "production", "model_version": "v2.0.0"}'
    }
    resp = lambda_handler(event, None)
    assert resp["statusCode"] == 200
    assert "PROMOTED" in resp["body"]
