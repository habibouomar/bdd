const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:27017/garage');

const carSchema = new mongoose.Schema({

    brand: { type: String, default: "" },
    model: { type: String, default: "" },
    year: { type: Number, default: null },
    created: { type: Date, default: Date.now }
})

const car = mongoose.model('Car', carSchema);

const a = new car({
    brand: "Renault",
    model: "Espace",
    year: 1999,
})
const b = new car({
    brand: "Renault",
    model: "Scenic",
    year: 2004,
})
const c = new car({
    brand: "Peugeot",
    model: "308",
    year: 2017,
})

// a.save();
// b.save();
// c.save();

car.findById("6261721a4372355c948698a5").exec().then(res => console.log('CAR INFO :', res));

car.updateOne({ model: "Espace" }, {
    year: 2000
  }).exec();

car.updateOne({ model: "308" }, {
    year: 2022
  }).exec();

car.deleteMany({ brand: "Renault" }).exec();

