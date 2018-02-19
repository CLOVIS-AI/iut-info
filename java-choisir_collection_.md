# Comment choisir la meilleure Collection à utiliser ?

Ici, "ordre" désigne l'ordre d'utilisation d'un `Iterator` (boucle `for-each`), "tri" désigne le tri avec `Comparable` ou `Comparator`.

Dans tout ce document, le choix le plus élevé est celui qui a les meilleures performances.

Il est conseillé de toujours privilégier les `Collections` sur les `Arrays`.

On peut utiliser :
		List<Integer> nombres = Arrays.asList(1, 2, 3);

Il est conseillé de toujours déclarer les Collections avec leur Interface et non leur implémentation ; exemple :
		Set<String> mots = new HashSet<>();

## Liste (doublons autorisés)

		Nom		Sortie		Expansion / Insertion		Entrée en fin
		ArrayList	Rapide		Lent				Rapide
		LinkedList	Lent		Rapide				Rapide

Note : `ArrayList` est presque toujours préféré sur `LinkedList`.

## Ensemble (doublons interdits)

		Nom		Ordonné ?	Trié ?		Taille		Vitesse
		HashSet		-		-		Lourd		Plus lent que ArrayList
		LinkedHashSet	Oui		-
		TreeSet		Oui		Oui				Lent

## Ensemble associatif (Clef - valeur)

		Nom		Ordonné ?	Trié ?		Taille		Vitesse
		HashMap		-		-		Lourd		Plus lent que ArrayList
		LinkedHashMap	Oui		-
		TreeMap		Oui		Oui				Lent
