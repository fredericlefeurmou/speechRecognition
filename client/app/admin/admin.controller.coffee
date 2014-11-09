'use strict'

angular.module 'speechRecognitionApp'
.controller 'AdminCtrl', ($scope, $http, Auth, User) ->

  $http.get '/api/users'
  .success (users) ->
    $scope.users = users

  $scope.delete = (user) ->
    User.remove id: user._id
    _.remove $scope.users, user

  $scope.createWord = (word) ->
    $http.post '/api/words',
      name: word
    .success (res) ->
      console.log 'word added'
      $scope.words.push res

  $scope.fetchAllWords = () ->
    $http.get '/api/words'
    .success (words) ->
      console.log 'words retrieved'
      console.log words
      $scope.words = words

  $scope.deleteWord = (wordId) ->
    $http.delete '/api/words/' + wordId
    .success (res) ->
      console.log 'word deleted'
