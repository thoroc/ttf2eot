install: ttf2eot

	cp ttf2eot /usr/bin

ttf2eot: OpenTypeUtilities.o ttf2eot.o

	g++ -O3 -o $@ $^

	strip $@

OpenTypeUtilities.o: OpenTypeUtilities.cpp

	g++ -O3 -c -o $@ $^

ttf2eot.o: ttf2eot.cpp

	g++ -O3 -c -o $@ $^

clean:

	rm -f ttf2eot OpenTypeUtilities.o ttf2eot.o
