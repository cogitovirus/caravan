# Caravan
A modern marketing data platform.

bluecaravan.io

## Stack
- Dataflow engine - Apache NiFi https://github.com/apache/nifi
- Frontend - ?
- ? PySpark + Databricks + Snowflake
- Any extra API services written in Typescript + ?
- GCP as a primiary cloud provider
- Terraform as a IaC tool
- OpenAI for NLP services
- BI tools - ?
- JebBrains TeamCity for CI/CD

## Trivia

"Caravan" is an American jazz standard that was composed by Juan Tizol and Duke Ellington and first performed by Ellington in 1936. Irving Mills wrote lyrics, but they are rarely sung. The song is in the key of F major and is in 4/4 time. The tempo is 120 beats per minute. The song is in the form of a 32-bar AABA song.

In the recent times, the song was popularized by a 2014 American independent psychological drama film written and directed by Damien Chazelle and starring Miles Teller, J.K. Simmons, Paul Reiser and Melissa Benoist. The film expores a toxic relationship between a young jazz drumer, Andrew Neiman (played by Miles Teller), and his demanding music instructor, Terence Fletcher (played by J.K. Simmons)[1](https://youtu.be/ZZY-Ytrw2co)

## TODO:
- [ ] gcs dev env terraform init
- [ ] setup nifi

## Milestones
### Epic 1: Dataflow engine
- [ ] deploy backend to GCP
- [ ] create GCS to Snowflake dataflow
### Epic 2: Marketing Jarvis
- [ ] short feedback loop - ouroboros - feed the dataflow chain with the project documentation
- [ ] create the chatbot
- [ ] add the issue tracker as the second source of data
### Epic 3: Customer facing frontend
- [ ] Design
