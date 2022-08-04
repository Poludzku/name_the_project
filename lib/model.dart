class Glossary {
  final String title;
  final GlossDiv glossDiv;

  Glossary(this.title, this.glossDiv);

  Glossary.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        glossDiv = GlossDiv.fromJson(json['GlossDiv']);
}

class GlossDiv {
  final String title;
  final GlossList glossList;

  GlossDiv(this.title, this.glossList);

  GlossDiv.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        glossList = GlossList.fromJson(json['GlossList']);
}

class GlossList {
  final GlossEntry glossEntry;

  GlossList(this.glossEntry);

  GlossList.fromJson(Map<String, dynamic> json)
      : glossEntry = GlossEntry.fromJson(json['GlossEntry']);

  @override
  String toString() {
    return 'glossEntry: $glossEntry';
  }
}

class GlossEntry {
  final String id;
  final String sortAs;
  final String glossTerm;
  final String acronym;
  final String abbrev;
  final GlossDef glossDef;
  final String glossSee;

  GlossEntry(this.id, this.sortAs, this.glossTerm, this.acronym, this.abbrev, this.glossDef,
      this.glossSee);

  GlossEntry.fromJson(Map<String, dynamic> json)
      : id = json['ID'],
        sortAs = json['SortAs'],
        glossTerm = json['GlossTerm'],
        acronym = json['Acronym'],
        abbrev = json['Abbrev'],
        glossDef = GlossDef.fromJson(json['GlossDef']),
        glossSee = json['GlossSee'];

  @override
  String toString () {
    return 'id: $id \nsortAs: $sortAs';
  }
}

class GlossDef {
  final String para;
  final List<String> glossSeeAlso;

  GlossDef(this.para, this.glossSeeAlso);

  GlossDef.fromJson(Map<String, dynamic> json)
      : para = json['para'],
        glossSeeAlso = (json['GlossSeeAlso'] as List<dynamic>).map((e) => e.toString()).toList();
}
