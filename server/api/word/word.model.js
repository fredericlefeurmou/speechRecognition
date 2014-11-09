'use strict';

var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

var WordSchema = new Schema({
  name: String,
});

module.exports = mongoose.model('Word', WordSchema);