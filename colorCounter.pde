/**
 * Dominant Color Sort III (v1.03)
 * GoToLoop (2016-Jan-11)
 * altered by Tom Luyten (www.tomluyten.com)
 * forum.Processing.org/two/discussion/14393/getting-the-dominant-color-of-an-image
 * JavaRevisited.BlogSpot.com/2012/12/how-to-sort-hashmap-java-by-key-and-value.html
 */

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import java.util.Map;
import static java.util.Map.Entry;
import java.util.LinkedHashMap;

boolean showColors = false;
boolean go = false;
PImage selectedImage;

static final int QTY = 5, VARIATION = 50;
final color[] dominantArr = new color[QTY];
final Map<Integer, Integer> dominantMap =
  new LinkedHashMap<Integer, Integer>(QTY, 1.0);

color[] myColors;

Map<Integer, Integer> map, sortedMap;
PImage pic;
int len;

void setup() {
  size(990, 660);

  myColors = new color[5];
 selectInput("Select a file to process:", "fileSelected");
}

void draw() {
  if (go) {
    image(selectedImage, 0, 0, 500,500);

    if (showColors) {
      for (int i=0; i<myColors.length; i++) {
        //println(myColors[i]);
        fill(red(myColors[i]), green(myColors[i]), blue(myColors[i]));
        ellipse(50+ i*(width/myColors.length), height/2, 30, 30);
      }
    }
  }
}

void mousePressed() {
  showColors = true;
}


static final Map<Integer, Integer> countColorsIntoMap(final color... colors) {
  final Map<Integer, Integer> map = new HashMap<Integer, Integer>();

  for (color c : colors) {
    final Integer count = map.get(c &= ~#000000); // c |= #000000
    map.put(c, count == null? 1 : count + 1);
  }

  return map;
}

static final <K extends Comparable<K>, V extends Comparable<V>>
  Map<K, V> sortMapByValues(final Map<K, V> map)
{
  final int len = map.size(), capacity = ceil(len/.75) + 1;
  final List<Entry<K, V>> entries = new ArrayList<Entry<K, V>>(map.entrySet());

  Collections.sort(entries, new Comparator<Entry<K, V>>() {
    @ Override public int compare(final Entry<K, V> e1, final Entry<K, V> e2) {
      final int sign = e2.getValue().compareTo(e1.getValue());
      return sign != 0? sign : e1.getKey().compareTo(e2.getKey());
    }
  }
  );

  final Map<K, V> sortedMap = new LinkedHashMap<K, V>(capacity);
  for (final Entry<K, V> entry : entries)
    sortedMap.put(entry.getKey(), entry.getValue());

  return sortedMap;
}

void processColors() {
  len = selectedImage.pixels.length;

  map = countColorsIntoMap(selectedImage.pixels);
  sortedMap = sortMapByValues(map);

  dominantMap.clear();
  java.util.Arrays.fill(dominantArr, 0);

  println("\nUnique colors found:", map.size(), "\tfrom:", len, ENTER);

  int idx = 0;
  for (final Entry<Integer, Integer> colors : sortedMap.entrySet()) {
    dominantMap.put(dominantArr[idx] = colors.getKey(), colors.getValue());
    if (++idx == QTY)  break;
  }

  idx = 0;
  for (final Entry<Integer, Integer> colors : dominantMap.entrySet())
    //myColors[colors.getKey()] = hex(colors.getKey(), 6));
    myColors[++idx-1] = colors.getKey();

//println(myColors);
 go = true;
 showColors = true;
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    selectedImage = loadImage(selection.getAbsolutePath());
  }

  processColors();
}
