'use strict'

angular.module 'speechRecognitionApp'
.controller 'MainCtrl', ($scope, $http) ->

  recognition = new webkitSpeechRecognition()
  recognition.onresult = (event) -> 
    $scope.userSpeech = event.results[0][0].transcript
    $scope.userScore = Math.round(event.results[0][0].confidence * 100);
    $scope.$digest() 

  recognition.start()