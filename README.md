# Caravan
A modern marketing data platform.

bluecaravan.io

## Stack
- Dataflow engine - Apache Airflow + dbt
- Processing - PySpark
- Destinations - Databricks + Snowflake
- Extra API services will be written in Typescript with ...?
- GCP as a primary cloud provider
- Terraform as a IaC tool
- OpenAI for NLP services
- BI tools -?
- JetBrains TeamCity for CI/CD or other? CircleCI? Jenkins?

## Local setup
Follow this [quickstart](https://airflow.apache.org/docs/apache-airflow/stable/start.html), then run: 
```
airflow standalone
```

## Python venv
```
# create virtual environment
python3 -m venv myenv
# activate virtual environment
source myenv/bin/activate
# install dependencies
pip install -r requirements.txt
# deactivate virtual environment after you are done
deactivate
```
to save new dependencies:
```
pip freeze > requirements.txt
```

## Trivia

"Caravan" is an American jazz standard that was composed by Juan Tizol and Duke Ellington and first performed by Ellington in 1936. Irving Mills wrote lyrics, but they are rarely sung. The song is in the key of F major and is in 4/4 time. The tempo is 120 beats per minute. The song is in the form of a 32-bar AABA song.

In recent times, the song was popularized by a 2014 American independent psychological drama film written and directed by Damien Chazelle and starring Miles Teller, J.K. Simmons, Paul Reiser and Melissa Benoist. The film explores a toxic relationship between a young jazz drummer, Andrew Neiman (played by Miles Teller), and his demanding music instructor, Terence Fletcher (played by J.K. Simmons)[1](https://youtu.be/ZZY-Ytrw2co)

## TODO:
- [ ] gcs dev env terraform init
- [ ] JAVA_HOME setup for Nifi simple terraform init
- [ ] Terraform Nifi port setup
- [ ] Firewall configuration
 
## Milestones
### Epic 1: Dataflow engine
- [ ] deploy backend to GCP
- [ ] create GCS to Snowflake dataflow
### Epic 2: Marketing Jarvis
- [ ] short feedback loop - ouroboros - feed the dataflow chain with the project documentation
- [ ] create the chatbot
- [ ] add the issue tracker as the second source of data
### Epic 3: Customer-facing frontend
- [ ] Design
