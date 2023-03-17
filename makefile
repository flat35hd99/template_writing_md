py3=python

DRAW_SCRIPT=$(shell ls script/draw/*.py)
DRAWED_FIGURE=$(DRAW_SCRIPT:script/draw/%.py=figure/%.png)

all: format directory pdf word

directory:
	mkdir -p figure

# Generate graphs
figure/%.png: script/draw/%.py
	$(py3) $< -o $@
 
# Generate pdf manuscript
pdf: $(GRAPHS_USED_BY_PAPER)
	$(MAKE) -C paper pdf

word: $(GRAPHS_USED_BY_PAPER)
	$(MAKE) -C paper word

format:
	black .
	autoflake --in-place --recursive --remove-all-unused-imports .
	isort .

clean:
	rm -rf \
		output \
		figure
	$(MAKE) -C paper clean
