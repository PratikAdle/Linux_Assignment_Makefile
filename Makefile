output: /home/pratik/Assignment/objs/main.o /home/pratik/Assignment/objs/file_1.o /home/pratik/Assignment/objs/file_2.o
	gcc /home/pratik/Assignment/objs/main.o /home/pratik/Assignment/objs/file_1.o /home/pratik/Assignment/objs/file_2.o -o /home/pratik/Assignment/bin/output

/home/pratik/Assignment/objs/main.o: /home/pratik/Assignment/src/main.c
	cd /home/pratik/Assignment/objs/ && \
	gcc -c /home/pratik/Assignment/src/main.c && \
	cd -

/home/pratik/Assignment/objs/file_1.o: /home/pratik/Assignment/src/file_1.c
	cd /home/pratik/Assignment/objs/ && \
	gcc -c /home/pratik/Assignment/src/file_1.c && \
	cd -

/home/pratik/Assignment/objs/file_2.o: /home/pratik/Assignment/src/file_2.c
	cd /home/pratik/Assignment/objs/ && \
	gcc -c /home/pratik/Assignment/src/file_2.c && \
	cd -

clean:
	rm /home/pratik/Assignment/objs/*.o /home/pratik/Assignment/bin/output
