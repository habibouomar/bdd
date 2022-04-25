const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:27017/garage');

const CarModel = require('./models/Car')

const a = new CarModel({
    brand: "Renault",
    model: "Espace",
    year: 1999,
})
const b = new CarModel({
    brand: "Renault",
    model: "Scenic",
    year: 2004,
})
const c = new CarModel({
    brand: "Peugeot",
    model: "308",
    year: 2017,
})

const d = new CarModel({
    brand: "Mercedez",
    model: "cls",
    year: 2022,
})

// a.save();
// b.save();
// c.save();
// d.save();

CarModel.findById("6261721a4372355c948698a5").exec().then(res => console.log('CAR INFO :', res));

CarModel.updateOne({ model: "Espace" }, {
    year: 2000
  }).exec();

CarModel.updateOne({ model: "308" }, {
    year: 2022
  }).exec();

CarModel.deleteMany({ brand: "Renault" }).exec();