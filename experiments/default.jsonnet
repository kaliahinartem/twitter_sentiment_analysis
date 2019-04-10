// For example, you can write variable declrations as follows:
local embedding_dim = 100;
local hidden_dim = 200;

{
  // data reader config
  "dataset_reader": {
    "type": "SemEval2017-Task4-SubsetA"
  },
  "train_data_path": "dataset/train/",
  "validation_data_path": "dataset/test/",
  
  // model config
  "model": {
    "type": "semeval_classifier",
    "word_embeddings": {
        "tokens": {
          "type": "embedding",
          "pretrained_file": "https://s3-us-west-2.amazonaws.com/allennlp/datasets/glove/glove.6B.100d.txt.gz",
          "embedding_dim": embedding_dim,
          "trainable": false
      },
      
    },
    "encoder": {
      "type": "lstm",
      "embedding_dim": embedding_dim,
      "hidden_size": hidden_dim
    }
  },

  // data iterator config
  "iterator": {
    "type": "bucket",
    "sorting_keys":  [["tokens", "num_tokens"]],
    "batch_size": 64
  },

  // trainer config
  "trainer": {
    "num_epochs": 40,
    "patience": 10,
    "cuda_device": 0,
    "optimizer": {
      "type": "adam"
    }
  }
}