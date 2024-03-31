const express = require('express');
const router = express.Router();
const ConfirmReturnLibrarian = require('../../app/controllers/librarian/ConfirmReturnLibrarianiControllers')

router.put('/confirm', ConfirmReturnLibrarian.UpdateStateTo_Confirm)


module.exports = router

