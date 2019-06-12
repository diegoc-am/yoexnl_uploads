# ImageUploader

Uploads images to [S3][s3], using a front end as disguise

## Developing

### Getting Dependencies

```bash
bundle install
```

### Environment Variables

The following variables are required during runtime

```bash
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
AWS_BUCKET=
```

### Shipping
```bash
docker build . -t image_uploader:latest
export DESIRED_PORT=9292
export ENVIRONMENT=production
docker run -p "$DESIRED_PORT":9292 image_uploader:latest bundle exec rackup -o 0.0.0.0 -E "$ENVIRONMENT"
```

## Contributors
* Diego Camargo


[s3]: https://aws.amazon.com/s3/
