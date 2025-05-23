default: giftcardreader asan ubsan

giftcardreader: giftcardreader.c giftcard.h
	gcc -g -o giftcardreader.original giftcardreader.c

asan: giftcardreader.c giftcard.h
	gcc -fsanitize=address -g -o giftcardreader.asan giftcardreader.c

ubsan: giftcardreader.c giftcard.h
	gcc -fsanitize=undefined -ls
g -o giftcardreader.ubsan giftcardreader.c

test: giftcardreader asan ubsan
	./runtests.sh

# .PHONY tells make to always assume this target needs
# to be rebuilt
.PHONY: clean
clean:
	rm -f *.o giftcardreader.original giftcardreader.asan giftcardreader.ubsan
