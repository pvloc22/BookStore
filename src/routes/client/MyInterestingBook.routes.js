const express = require('express');
const router = express.Router();
const  myInterestingBook = require('../../app/controllers/client/MyInterestingBookControllers')

router.get('/:token', myInterestingBook.MyInterestingBookGet)


module.exports = router