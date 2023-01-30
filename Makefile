DATA_FILE        = data.json
MUSTACHE_CC      = ./hbs.ts
DENO             = deno
DENO_CC          = --allow-read=. \
				   --allow-write=. \
				   --no-check \
				   --no-config \
				   --no-lock \
				   --no-prompt
MUSTACHE_CCFLAGS = --hbs.noEscape --hbs.strict
TARGET           = README.md

.PHONY: install build clean

build: $(TARGET)
clean:
	rm -f $(TARGET)

%: %.hbs $(DATA_FILE) $(MUSTACHE_CC) 
	$(DENO) run $(DENO_CC) $(MUSTACHE_CC) $(MUSTACHE_CCFLAGS) -d $(DATA_FILE) -o $@ $< 
