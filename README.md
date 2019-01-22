# Pokédex

This is the slides and sample project I used for the talk I gave at the Cocoaheads in Montpellier on January 17th, 2019, about Machine Learning, Apple and building a Pokédex app.

An article is also available on my technical blog here:

[https://david.y4ng.fr/machine-learning-and-apple-pokedex](https://david.y4ng.fr/machine-learning-and-apple-pokedex)

## ML Data folder

Contains training and evaluation data for the creation of the PokemonModel.mlmodel with Create ML.

## Pokedex playground

Contains a simple Playground initiating an Image Classifier Builder with Create ML.

## Pokedex Xcode Project

The demo app. It contains two screens available from Tab Bar:

- **Library**: present a UIImagePickerController that will let you pick a Pokémon picture from your devices Photo Library and display the prediction result in a UIAlertController.
- **Camera**: display the live video feed from your device's camera and display the live prediction results on the screen.