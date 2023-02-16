# Week 0 — Billing and Architecture

## Required Homework

### Install and Verify AWS CLI

I am able to install the AWS CLI using Gitpod.

In order to prove that I am able to use the AWS ClI.
I am providing the instructions I used for installing AWS CLI using Gitpod.

I did the following steps to install AWS CLI.

I followed the instructions on the AWS CLI Install Documentation Page
You can reach out to that using the following link

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```

![installing aws cli](https://user-images.githubusercontent.com/84492994/219371113-6ea68aff-7820-4a6f-b2e4-3b8fe6edc4b9.jpg)


### Create a Budget

I created my own budget for $1 because I cannot afford any kind of spend.

![budget-alarm](https://user-images.githubusercontent.com/84492994/219376613-4e6341e4-3ad5-46f8-8269-d845646dac44.jpg)

### Recreate Logical Architectural Design

![Cruddur Logical Diagram](https://user-images.githubusercontent.com/84492994/219379579-7eecc7e8-a46f-47d8-9c80-5fd521cf0336.jpeg)

[Lucid Charts Share Link](https://lucid.app/lucidchart/bde2bf94-3cab-430d-bf53-a64eaf436c13/edit?viewport_loc=-196%2C25%2C1792%2C765%2C0_0&invitationId=inv_3e673c96-dd86-41de-8d95-fe18295585ef)

## Example of Referencing a file in the codebase

Example of me referencing a file in my repo [week0/aws/json/alarm-config.json](https://github.com/MohanVaddella/aws-bootcamp-cruddur-2023/blob/main/aws/json/alarm-config.json)

## List Example
- This 
- Is 
- A
- List
1. This
2. Is
3. A
4. Ordered 
5. List

## Table Example

| My | Cool | Table |
| --- | --- | --- |
| Hello | World | ! |

## Code Example

```json
{
    "AlarmName": "DailyEstimatedCharges",
    "AlarmDescription": "This alarm would be triggered if the daily estimated charges exceeds 50$",
    "ActionsEnabled": true,
    "AlarmActions": [
        "arn:aws:sns:ap-south-1:105178145684:billing-alarm"
    ],
    "EvaluationPeriods": 1,
    "DatapointsToAlarm": 1,
    "Threshold": 50,
    "ComparisonOperator": "GreaterThanOrEqualToThreshold",
    "TreatMissingData": "breaching",
    "Metrics": [{
        "Id": "m1",
        "MetricStat": {
            "Metric": {
                "Namespace": "AWS/Billing",
                "MetricName": "EstimatedCharges",
                "Dimensions": [{
                    "Name": "Currency",
                    "Value": "USD"
                }]
            },
            "Period": 86400,
            "Stat": "Maximum"
        },
        "ReturnData": false
    },
    {
        "Id": "e1",
        "Expression": "IF(RATE(m1)>0,RATE(m1)*86400,0)",
        "Label": "DailyEstimatedCharges",
        "ReturnData": true
    }]
}
```

