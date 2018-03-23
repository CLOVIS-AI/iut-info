# Utiliser les Streams en Java

La plupart du contenu de ce fichier est tiré de [Winterbe](http://winterbe.com/posts/2014/07/31/java8-stream-tutorial-examples/).

# Opérations principales sur les Streams

## Filter

    filter(e -> BOOLÉEN)

Si `BOOLÉEN` vaut `true`, l'élément est gardé.

## Map

    map(e -> AUTRE)

Chaque élément du Stream est remplacé par son `AUTRE` correspondant. Par exemple, pour convertir un Stream de Strings en entiers, on utilise:

    Stream.of("1", "2")
      .map(Integer::valueOf)
      .forEach(System.out::println);

Pour convertir un Stream en entiers ou en réels, il existe:

    mapToInt(...)
    mapToDouble(...)
    mapToLong(...)

Ces versions permettent d'appeller `sum()` et `average()`. Inversement, il existe aussi `mapToObj(...)`.

## Sorted

    sorted((e1, e2) -> ENTIER)

Trie le Stream.
 - Si `e1` est égal à `e2` (d'après `equals()`), alors `ENTIER=0`.
 - Si `e1` est plus grand que `e2`, `ENTIER>0`.
 - Si `e1` est plus petit que `e2`, `ENTIER<0`.

## Match

    anyMatch(e -> BOOLÉEN)

Renvoie le premier élément pour lequel `BOOLÉEN` vaut `true`. Attention, dans le cas des ParallelStream, le "premier élément trouvé" n'est pas forcément la première occurence (= le Stream est lu dans le désordre). Pour être sûr de trouver le premier élément dans l'ordre du Stream, on utilise `firstMatch(e -> BOOLÉEN)`, mais les performances sont plus faibles !

## Collect

Permet de transformer un Stream en autre chose, en gardant tous les éléments ; par exemple, une Liste, un Set...

Transformer un Stream en liste:

    Stream.of("1", "2")
      .collect(Collectors.toList());

De la même manière, pour convertir un Stream en Set, on utilise `Collectors.toSet()`.

Grouper par âge:

    List<Person> people = Arrays.asList(new Person(1), new Person(2)...);
    Map<Integer, List<Person>> peopleByAge;
    peopleByAge = people.stream()
      .collect(Collectors.groupingBy(p -> p.age));

Créer un String qui regroupe tout:

    String phrase = people.stream()
      .collect(Collectors.joining(" et ", "Début: ", " Fin."));
    // Résultat:
    // Début: p1 et p2 et p3 ... et p15 Fin.

Créer sa Liste à la main:

    List<...>... = people.stream()
      .collect(ArrayList::new, ArrayList::add, ArrayList::addAll);

Les paramètres sont:
 - supplier : crée l'objet résultat (vide)
 - accumulator : ajoute un objet au résultat
 - combiner : si jamais deux objets de départ ont été créés, les combine en un

## Flatmap

Dans le cas d'une `map`, les objets sont remplacés un à un par leur correspondant. Dans le cas d'une `flatMap`, certains objets peuvent être remplacés par plusieurs correspondants, ou aucun.

Flatmap peut être utilisée pour regrouper des tableaux à deux dimensions en une dimension. Imaginons une Liste de Sets de A:

    List<Set<A>> objets;

On peut utiliser Flatmap pour récupérer une liste de tous les A:

    List<A> = objets.stream()       // Stream de Set<A>
      .flatMap(e -> e.stream())     // Stream de A
      .collect(Collectors.toList()) // Cf. 'Collect'

Le même code en empêchant les `NullPointerException`:

    List<A> = objets.stream()
      .flatMap(e -> Optional.ofNullable(e.stream()))
      .collect(Collectors.toList())

## Reduce


