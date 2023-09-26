const { DataTypes, Model } = require('sequelize');

class User extends Model {
    static initiate(sequelize){
        User.init({
            id: {
                type: DataTypes.INTEGER,
                primaryKey: true,
                autoIncrement: true
            },
            userid: {
                type: DataTypes.STRING(40),
                allowNull: false
            },
            userpassword: {
                type: DataTypes.STRING(255),
                allowNull: false
            },
            useremail: {
                type: DataTypes.STRING(100),
                allowNull: false
            },
            authority: {
                type: DataTypes.INTEGER,
                allowNull: false
            }
        }, {
            sequelize,
            timestamps: true,
            underscored: false,
            modelName: 'User',
            tableName: 'accountuser',
            paranoid: false,
            charset: 'utf8',
            collate: 'utf8_general_ci',
            updatedAt: false,
            createdAt: false
        })
    }

    static associate(db){}
}

module.exports = User;