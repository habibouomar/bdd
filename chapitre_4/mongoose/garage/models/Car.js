const mongoose = require('mongoose');

const carSchema = new mongoose.Schema({

    brand: { type: String, default: "" },
    model: { type: String, default: "" },
    year: { type: Number, default: null },
    created: { type: Date, default: Date.now }
})

const Car = mongoose.model('Car', carSchema);
module.exports = Car;
