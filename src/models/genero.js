const { DataTypes } = require('sequelize');
const sequelize = require('../conection/connection');
const Genero = sequelize.define('genero', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    genero: {
        type: DataTypes.STRING,
        allowNull: true,
      default: false,
    }
}, {
        tableName: 'genero',
        timestamps: false,
      });
    
module.exports = Genero;