const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:27017/populate');

const studentSchema = new mongoose.Schema({

    fisrtName: { type: String, default: "" },
    surName: { type: String, default: "" },
    address:{type: mongoose.Types.ObjectId, ref:'Address'}
})

const Student = mongoose.model('Student', studentSchema);
 
const addressSchema = new mongoose.Schema({

    streetName: { type: String, default: "" },
    streetNumber: { type: String, default: "" },
    postCode: { type: String, default: "" },
    city: { type: String, default: "" }
})

const Address = mongoose.model('Address', addressSchema);

//////////////

const personAddress = new Address({
    streetName: "rue de paris",
    streetNumber: "109",
    postCode: "21210",
    city: "Sydney",
})

const person = new Student({
    fisrtName: "John",
    surName: "Doe",
    address: personAddress._id
})

// personAddress.save().then(res => console.log(res))
// person.save()

const personAddressBis = new Address({
    streetName: "boulevard jaures",
    streetNumber: "59",
    postCode: "75210",
    city: "Paris",
})

const personBis = new Student({
    fisrtName: "Jane",
    surName: "Doe",
    address: personAddress._id
})

// personAddressBis.save().then(res => console.log(res))
// personBis.save()

Student
  .findOne({ _id: '62615caa1ce00e1a544d50a9' })
  .populate('address')
  .exec().then(res => console.log('STUDENT INFO :', res));