import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["What should I eat today?","Hmmm...","Japanese food?", "Israeli food?","No no no! Korean!", "But I already ate Korean 2 days..", "Let's start and look for the right meal", "Oh here is some random facts about food :D",
    "The oldest evidence for soup is from 6,000 B.C. and calls for hippopotamus and sparrow meat.",
     " Pringles once had a lawsuit trying to prove that they weren't really potato chips.",
     "Pound cake got its name from its original recipe, which called for a pound each of butter, eggs, sugar, and flour.",
     "Ripe cranberries will bounce like rubber balls.",
     "An average ear of corn has an even number of rows, usually 16.",
     "Consuming dairy may cause acne.",
     "Most wasabi consumed is not real wasabi, but colored horseradish.",
     "Central Appalachia's tooth decay problem is referred to as Mountain Dew mouth, due to the beverage's popularity in the region.",
     "Apples belong to the rose family, as do pears and plums.",
     "Oklahoma's state vegetable is the watermelon.",
     "One of the most popular pizza toppings in Brazil is green peas. Sounds good :o.",
     "About 70% of olive oil being sold is not actually pure olive oil.",
     "Real aged balsamic vinegar actually costs anywhere from $75 to $400 or more.",
     "Store bought 100% (real) orange juice is 100% artificially flavored.",
     "The most expensive pizza in the world costs $12,000 and takes 72 hours to make."],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
