const express = require('express');
const router = express.Router();
const presencaController = require('../controllers/presenca.controller');

router.get('/', presencaController.findAll);
router.get('/:id', presencaController.findOne);
router.post('/', presencaController.create);
router.put('/:id', presencaController.update);
router.delete('/:id', presencaController.delete);

module.exports = router;