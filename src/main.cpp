#define PI 3.141592653589793284

#include "Typical.h"

const static int SCREEN_WIDTH = 1980;
const static int SCREEN_HEIGHT = 1080;

int main(){

	sf::RenderWindow window;
	
   window.create(
        sf::VideoMode(SCREEN_WIDTH, SCREEN_HEIGHT, 32), 
        "Dragonfly Mission Control"
    );

    sf::CircleShape shape(window.getSize().y/2);
	shape.setFillColor(sf::Color::White);
	
	// shape.move(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);

	sf::Texture shapeTexture;
	shapeTexture.loadFromFile("support/Texture_Kit_01.jpg");
	shape.setTexture(&shapeTexture);

	sf::Event event;

	while (window.isOpen())
	{
		while (window.pollEvent(event))
		{
			if (event.type == sf::Event::Closed)
				window.close();
		}

		window.clear();
		window.draw(shape);
		window.display();
	}

    return 0;
}
