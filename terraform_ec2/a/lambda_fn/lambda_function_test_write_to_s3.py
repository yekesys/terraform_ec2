
     
  
import json
import datetime as dt
import os
import boto3
                
SECRETS_STORE_ENV_VAR_NAME = "SECRET_STORE"
REGION_NAME = "us-east-1"

def lambda_handler(event, context):
    print(event)

    secrets_location = os.environ.get(SECRETS_STORE_ENV_VAR_NAME)

    session_client = boto3.session.Session()

    secretsmanager = session_client.client(
                             service_name          = "secretsmanager",
                             region_name           = REGION_NAME,
                             #aws_access_key_id     = aws_access_key,
                             #aws_secret_access_key = aws_secret_key,
                           )

    if not secrets_location:
        return {
            "statusCode": 500,
            "body": json.dumps(f"Error: could not find secrets location '{SECRETS_STORE_ENV_VAR_NAME}'"),
            }

    secret_value_response = secretsmanager.get_secret_value(SecretId = secrets_location)
    # The value for "SecretString" is json and looks like a dictionary
    # Here it is made into a dictionary with json.loads
    the_secrets = json.loads(secret_value_response["SecretString"])
        
    # Get the various parameters from inside the secret called "parms"
    navex_params = json.loads(the_secrets.get("parms"))
    """
    { "bucket_name": "..."
    , "s3_file_path_cases", "..."
    }
    """

    # Get the various parameters
    bucket_name = navex_params.get("bucket_name")
    s3_file_path = navex_params.get("s3_file_path_cases")
    s3_file_path = "test_folder/"

    dttmstr = f"{dt.datetime.now().strftime('%Y%m%dT%H%M%S')}"
    dt_tm_str = f"{dt.datetime.now().strftime('%Y-%m-%d')} {dt.datetime.now().strftime('%H:%M:%S')}"
    file_key_name = f"{s3_file_path}testing_lambda_function_{dt.datetime.now().isoformat(sep='T').replace(':', '')}.txt"
    file_key_name = f"{s3_file_path}testing_lambda_function_{dttmstr}.txt"

    s3_resource = boto3.resource(
                             "s3",
                             #aws_access_key_id     = aws_access_key_id,
                             #aws_secret_access_key = aws_secret_access_key,
                         )
    bucket = s3_resource.Bucket(bucket_name)
    data_string = f"this is a test for writing to S3 at {dt_tm_str} GMT"
    print(f"Testing writing '{file_key_name}' to S3 bucket '{bucket_name}'")
    rslt = object = bucket.put_object(
        Body=data_string.encode("utf-8"),
        Key=file_key_name,
      )

    return {
        "statusCode": 200,
        # If we get to the end, it is successful
        "body": json.dumps(f"Successful.  Returned from '.put_object()':  {rslt}"),
    }


