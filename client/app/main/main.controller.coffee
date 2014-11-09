'use strict'

angular.module 'speechRecognitionApp'
.controller 'MainCtrl', ($scope, $http) ->

  recognition = new webkitSpeechRecognition()
  recognition.onresult = (event) -> 
    $scope.userSpeech = event.results[0][0].transcript
    $scope.userScore = Math.round(event.results[0][0].confidence * 100);
    $scope.$digest()

  $scope.newTry = () ->
    if $scope.words?
      $scope.wordToMatch = $scope.words[Math.floor(Math.random() * $scope.words.length)];
      recognition.start()


  $scope.fetchAllWords = () ->
    $http.get '/api/words'
    .success (words) ->
      console.log 'words retrieved'
      console.log words
      $scope.words = words
      $scope.newTry()
