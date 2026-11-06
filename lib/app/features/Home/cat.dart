class Cat {
  const Cat({
    required this.id,
    required this.name,
    required this.breed,
    required this.gender,
    required this.age,
    required this.pricePerHour,
    required this.summary,
    required this.personality,
    required this.specialCare,
    required this.favoriteActivities,
    required this.imagePath,
  });

  final String id;
  final String name;
  final String breed;
  final String gender;
  final String age;
  final int pricePerHour;
  final String summary;
  final String personality;
  final String specialCare;
  final String favoriteActivities;
  final String imagePath;

  String get listingDescription => '$pricePerHour₽/час. $summary';
}

const cats = [
  Cat(
    id: 'barsik',
    name: 'Барсик',
    breed: 'Домашняя короткошерстная',
    gender: 'Мальчик',
    age: '3 года',
    pricePerHour: 350,
    summary: 'Любит дремать рядом и мурлыкать.',
    personality: 'Спокойный и ласковый, быстро привыкает к новым людям.',
    specialCare: 'Особого ухода не требуется.',
    favoriteActivities: 'Дремать рядом с человеком и получать ласку.',
    imagePath: 'assets/images/test_image.jpg',
  ),
  Cat(
    id: 'sonya',
    name: 'Соня',
    breed: 'Сибирская',
    gender: 'Девочка',
    age: '4 года',
    pricePerHour: 400,
    summary: 'Обожает уютные пледы и спокойные вечера.',
    personality: 'Нежная и тихая, любит находиться рядом с человеком.',
    specialCare: 'Нужно регулярно расчесывать густую шерсть.',
    favoriteActivities: 'Отдыхать на пледе и слушать чтение.',
    imagePath: 'assets/images/test_image.jpg',
  ),
  Cat(
    id: 'pushok',
    name: 'Пушок',
    breed: 'Британская короткошерстная',
    gender: 'Мальчик',
    age: '2 года',
    pricePerHour: 450,
    summary: 'Всегда рад новой игрушке и компании.',
    personality: 'Общительный и игривый, охотно идет на контакт.',
    specialCare: 'Следить, чтобы всегда была свежая вода.',
    favoriteActivities: 'Играть с мячиками и удочкой.',
    imagePath: 'assets/images/test_image.jpg',
  ),
  Cat(
    id: 'luna',
    name: 'Луна',
    breed: 'Русская голубая',
    gender: 'Девочка',
    age: '3 года',
    pricePerHour: 380,
    summary: 'Любит наблюдать за происходящим у окна.',
    personality: 'Уравновешенная, любопытная и дружелюбная.',
    specialCare: 'Предпочитает спокойную обстановку.',
    favoriteActivities: 'Сидеть у окна и исследовать новые места.',
    imagePath: 'assets/images/test_image.jpg',
  ),
  Cat(
    id: 'kuzya',
    name: 'Кузя',
    breed: 'Домашняя короткошерстная',
    gender: 'Мальчик',
    age: '1 год',
    pricePerHour: 420,
    summary: 'Любит играть и исследовать комнаты.',
    personality: 'Веселый и энергичный, легко поднимает настроение.',
    specialCare: 'Нужны активные игры и короткие перерывы на отдых.',
    favoriteActivities: 'Бегать за игрушками и изучать новые уголки.',
    imagePath: 'assets/images/test_image.jpg',
  ),
  Cat(
    id: 'marta',
    name: 'Марта',
    breed: 'Шотландская вислоухая',
    gender: 'Девочка',
    age: '5 лет',
    pricePerHour: 500,
    summary: 'Ценит ласку и спокойную атмосферу.',
    personality: 'Грациозная и ласковая, любит внимание.',
    specialCare: 'Гладить аккуратно, не трогая уши.',
    favoriteActivities: 'Отдыхать рядом и нежиться на мягкой лежанке.',
    imagePath: 'assets/images/test_image.jpg',
  ),
  Cat(
    id: 'ryzhik',
    name: 'Рыжик',
    breed: 'Домашняя короткошерстная',
    gender: 'Мальчик',
    age: '2 года',
    pricePerHour: 360,
    summary: 'Добродушный кот с звонким мурлыканьем.',
    personality: 'Общительный и дружелюбный, быстро становится другом.',
    specialCare: 'Особого ухода не требуется.',
    favoriteActivities: 'Знакомиться с людьми и играть с ленточкой.',
    imagePath: 'assets/images/test_image.jpg',
  ),
  Cat(
    id: 'alisa',
    name: 'Алиса',
    breed: 'Бенгальская',
    gender: 'Девочка',
    age: '3 года',
    pricePerHour: 470,
    summary: 'Любит сидеть у окна и знакомиться с гостями.',
    personality: 'Любознательная, аккуратная и спокойная.',
    specialCare: 'Нужны внимание и возможность подвигаться.',
    favoriteActivities: 'Играть и наблюдать за птицами из окна.',
    imagePath: 'assets/images/test_image.jpg',
  ),
  Cat(
    id: 'timofey',
    name: 'Тимофей',
    breed: 'Мейн-кун',
    gender: 'Мальчик',
    age: '6 лет',
    pricePerHour: 390,
    summary: 'Предпочитает ласку, компанию и уютный отдых.',
    personality: 'Добрый и невозмутимый, любит проводить время с людьми.',
    specialCare: 'Регулярно расчесывать длинную шерсть.',
    favoriteActivities: 'Отдыхать в уютном месте и наблюдать за домом.',
    imagePath: 'assets/images/test_image.jpg',
  ),
  Cat(
    id: 'nyusha',
    name: 'Нюша',
    breed: 'Персидская',
    gender: 'Девочка',
    age: '2 года',
    pricePerHour: 430,
    summary: 'Мягкий нрав и любовь к уютным местам.',
    personality: 'Милая и игривая, рада провести время вместе.',
    specialCare: 'Ежедневно расчесывать длинную шерсть.',
    favoriteActivities: 'Играть с мягкими игрушками и отдыхать на подушках.',
    imagePath: 'assets/images/test_image.jpg',
  ),
];

Cat? findCatById(String? id) {
  for (final cat in cats) {
    if (cat.id == id) return cat;
  }
  return null;
}
