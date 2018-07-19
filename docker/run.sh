mkdir -p archives data

# BUILD API
cd ../api
mix deps.get
MIX_ENV=prod mix compile
MIX_ENV=prod mix release
cp _build/prod/rel/togebuild/releases/${API_VERSION}/togebuild.tar.gz \
  ../docker/archives/api_${API_VERSION}.tar.gz

cd -
API_VERSION=${API_VERSION} docker-compose up
