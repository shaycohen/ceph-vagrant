import boto.s3.connection

access_key = '8QUW21WDVAMWCZ9N2C2T'
secret_key = 'zCP1cwLKk0I0WhD0YmCGWchyiEoZK9ZFpV3PkqGk'
conn = boto.connect_s3(
        aws_access_key_id=access_key,
        aws_secret_access_key=secret_key,
        host='deploy', port=7480,
        is_secure=False, calling_format=boto.s3.connection.OrdinaryCallingFormat(),
       )

bucket = conn.create_bucket('my-new-bucket')
for bucket in conn.get_all_buckets():
    print "{name} {created}".format(
        name=bucket.name,
        created=bucket.creation_date,
    )
