const Presenca = require('../models/presenca.model');

exports.findAll = async (req, res) => {
  try {
    const presencas = await Presenca.findAll();
    res.json(presencas);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.findOne = async (req, res) => {
  try {
    const presenca = await Presenca.findById(req.params.id);
    if (!presenca) {
      return res.status(404).json({ message: 'Presença não encontrada' });
    }
    res.json(presenca);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.create = async (req, res) => {
  try {
    const presenca = await Presenca.create(req.body);
    res.status(201).json(presenca);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.update = async (req, res) => {
  try {
    const presenca = await Presenca.update(req.params.id, req.body);
    res.json(presenca);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

exports.delete = async (req, res) => {
  try {
    await Presenca.delete(req.params.id);
    res.json({ message: 'Presença deletada com sucesso' });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};