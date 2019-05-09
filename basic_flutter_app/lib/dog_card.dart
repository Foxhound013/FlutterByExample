import 'package:flutter/material.dart';

import 'dog_model.dart'; // The dog model will provide all of the data (i.e. model) for the view.StatefulWidget

// This file acts like a set of view instructions for the data. It simply binds the data to the view.

// This is the top level widget for the dog card. It creates the state and then defers to the state class below
// for everything else.
class DogCard extends StatefulWidget {
  final Dog dog; // Var type is Dog and it is final.

  DogCard(this.dog); // instantiate the class, fill in the dog variable with the model.

  @override
  State<StatefulWidget> createState() => _DogCardState(dog); // Draw the state of the DogCard
}

// This is where all of the data/state drawing happens for the dog card. 
class _DogCardState extends State<DogCard> {
  Dog dog; // Declare the variable.

  _DogCardState(this.dog); // instantiate the class.

  // The top level widget for the dog card and the dog image.It acts as a container.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 115.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50.0,
              child: dogCard,
            ),
            Positioned(
              top: 7.5,
              child: dogImage,
            )
          ],
        ),
      ),
    );
  }

  // The following class will fetch the URL flutter uses to render the dog's image.
  String renderUrl; // The dog's image url.

  // The widget has two main bits, the dog image and the card
  // The dog image widget and all of it's styling.
  Widget get dogImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ??
              ''), //double question mark says if it's null, do the following.
        ),
      ),
    );
  }

  // Now lets build the card widget with all of it's styling.
  Widget get dogCard {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.dog.name,
                  style: Theme.of(context).textTheme.headline),
              Text(
                widget.dog.location,
                style: Theme.of(context).textTheme.subhead,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(':${widget.dog.rating} / 10'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

    // initializes the drawing of the object using the data (state)
  void initState() {
    super.initState();
    renderDogPic();
  }

  // sets the variable renderUrl using the dog model imageUrl.
  void renderDogPic() async {
    await dog.getImageUrl();
    setState(() {
      renderUrl = dog.imageUrl;
    });
  }
}
