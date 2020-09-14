SDK_PATH = $(HOME)/ciq
KEY = $(HOME)/.Garmin/key/developer_key.der

NAME = batt
APP_ID = c0797db5-6570-4db1-b7fc-474b1c51cebf

JUNGLE = monkey.jungle
ifeq ($(DEVICE),)
DEVICE = fr230
endif

MONKEYC = $(SDK_PATH)/bin/monkeyc
MONKEYDO = $(SDK_PATH)/bin/monkeydo

.PHONY: all clean sim graph

all: $(NAME).prg

clean:
	rm -f $(NAME)-fit_contributions.json
	rm -f $(NAME)-settings.json
	rm -f $(NAME).iq
	rm -f $(NAME).prg
	rm -f $(NAME).prg.debug.xml

$(NAME).prg: manifest.xml resources/*.xml source/*.mc
	$(MONKEYC) -d $(DEVICE) -f $(JUNGLE) -o $(NAME).prg -y $(KEY)

$(NAME).iq: manifest.xml resources/*.xml source/*.mc
	$(MONKEYC) -e -f $(JUNGLE) -o $(NAME).iq -y $(KEY)

sim: $(NAME).prg
	$(MONKEYDO) $(NAME).prg $(DEVICE)

graph:
	java -jar $(SDK_PATH)/bin/fit-graph.jar

era:
	$(SDK_PATH)/bin/era -k $(KEY) -a $(APP_ID)
