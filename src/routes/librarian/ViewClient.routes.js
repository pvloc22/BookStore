const express = require('express');
const router = express.Router();
const viewClientControllers  = require('../../app/controllers/librarian/ViewClientControllers')

router.put('/updateIsActive', viewClientControllers.f_updateIsActive)
router.get('/informationClient/:uid/:token', viewClientControllers.check_token, viewClientControllers.viewInformationClient)
router.get('/:token', viewClientControllers.check_token, viewClientControllers.ViewClientGet)


module.exports = router