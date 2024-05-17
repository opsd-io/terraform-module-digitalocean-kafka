module "example" {
  source = "github.com/opsd-io/terraform-module-digitalocean-kafka"

  cluster_name = "example"
  region       = "nyc1"
  topics = {
    "topic1" = {
      replication_factor = 3
      config = {
        retention_ms = 302400000
      }
    },
    "topic2" = {}
  }

  database_users = {
    "Donald" = {
      "topic1" = "consume",
      "topic2" = "produceconsume"
    },
    "Joe" = {
      "topic1" = "consume",
      "topic2" = "produce"
    }
  }
}
