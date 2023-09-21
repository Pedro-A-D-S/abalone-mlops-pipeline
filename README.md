# Abalone MLOps Pipeline

## Introduction
Welcome to the Abalone MLOps Pipeline project, undertaken by Acme Data Solutions Inc. In collaboration with **Acme Marine Research**, we've embarked on an exciting journey to solve the Abalone problem.

## The Abalone Problem

**Abalones**, a type of marine mollusk, have intrigued marine biologists and data scientists alike due to their complex growth patterns. Understanding an abalone's age from physical measurements is not only a fascinating scientific problem but also holds practical significance in various fields such as marine conservation and aquaculture.

**Acme Data Solutions Inc.** is a pioneering data and AI consultancy, specializing in cutting-edge solutions for businesses and research institutions. With a track record of successfully delivering AI and machine learning projects, we have been entrusted by Acme Marine Research to create an efficient and scalable solution to the Abalone problem.

## Our Mission
Our mission is to build an end-to-end Machine Learning Operations (MLOps) pipeline using AWS services that will:
- **Automate** data collection and preprocessing.
- **Train and deploy** machine learning models for abalone age estimation.
- **Monitor** model performance and retrain as needed.

## Architecture

![Architecture](data/images/architecture.png)

### AWS Services Used
This project utilizes several AWS services to create an end-to-end MLOps pipeline:
- **Amazon S3:** Object storage for data and artifacts.
- **AWS CodeCommit:** Version control for your code.
- **AWS CodePipeline:** Continuous integration and continuous delivery (CI/CD) service.
- **AWS Lambda:** Serverless compute service for event-driven tasks.
- **AWS Glue:** ETL (Extract, Transform, Load) service.
- **Amazon SageMaker:** Managed machine learning service.
- **Amazon CloudWatch:** Monitoring and logging service.
- **AWS CloudFormation:** Infrastructure as Code (IaC) service.
- **AWS Step Functions:** Serverless orchestration service.

The pipeline works as follows:

1. **Code** changes are pushed to the CodeCommit repository.
1. **CodePipeline** triggers a build when it detects a change in the1. CodeCommit repository.
1. **CodePipeline** builds the application code and runs unit tests.
1. **CodePipeline** deploys the application to a development environment.
1. **A Lambda function** is triggered to start the ETL process.
1. **AWS Glue performs** the ETL process to prepare and load the data for ML.
1. **CodePipeline** triggers a training job when it detects that the data is ready.
1. **SageMaker** trains the ML model.
1. **CodePipeline** deploys the trained ML model to a staging environment.
1. **Step Functions** runs an automated system test to validate the ML model.
1. **CodePipeline** deploys the ML model to production when the automated system test is successful.
1. **CloudWatch** monitors the performance of the ML model in production.

## Getting Started
To get started with this project, follow these steps:

### Prerequisites
- [Install Terraform](https://www.terraform.io/downloads.html)
- Set up a free-tier AWS account: [AWS Free Tier](https://aws.amazon.com/free/)

### Installation
1. Clone this repository:
```
git clone https://github.com/Pedro-A-D-S/mlops-aws-pipeline.git

cd mlops-aws-pipeline
```

2. Navigate to the CLI folder:
```
cd src/cli
```
3. Run the setup script to provision the infrastructure on cloud9:
```
./setup-cloud9.sh
```

## System Train Assets

The **System Train Assets** are fundamental components within our Abalone MLOps Pipeline, responsible for shaping the infrastructure and configurations essential for successful machine learning model training. This set of assets encompasses the vital groundwork, including infrastructure settings, data preprocessing routines, and training job configurations. They serve as the infrastructure and preparatory layer, ensuring that the environment is suitably configured and the dataset is properly prepared for subsequent model training phases.

![System Train Assets](data/images/system-train-assets.png)

## Training Assets

The **Training Assets** constitute the core of our Abalone MLOps Pipeline, where the alchemy of machine learning model development unfolds. This ensemble includes the machine learning model's source code, architectural blueprints, hyperparameter definitions, and data inputs, all harmoniously arranged to cultivate and refine our models. These assets are the epicenter of our data science journey, guiding the model's growth, evaluation, and enhancement. Within these assets reside the expertise and artistry necessary to construct precise models capable of estimating abalone ages with precision.
![Training Assets](data/images/training-assets.png)

## Pipeline Execution
After you've set everything up using the AWS Cloud9 service, this is going to be the pipeline execution:

![Pipeline Execution](data/images/pipeline-execution.png)

## Configuration
This project is configured to work with AWS's free-tier resources. You may need to configure your AWS credentials and region before running any scripts.

## Contributing
If you'd like to contribute to this project, please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b feature/my-feature`.
3. Make your changes and commit them: `git commit -m "Add new feature"`.
4. Push your branch to your fork: `git push origin feature/my-feature`.
5. Open a pull request on the original repository.

## License
This project is licensed under the [GNU General Public License v3.0](LICENSE).

## Resources
- [AWS Documentation](https://docs.aws.amazon.com/)
- [Terraform Documentation](https://www.terraform.io/docs/index.html)

