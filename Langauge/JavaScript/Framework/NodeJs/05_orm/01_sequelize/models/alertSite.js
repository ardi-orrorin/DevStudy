const Sequelize = require('sequelize');

class AlertSite extends Sequelize.Model{
    static initiate(sequelize){
        AlertSite.init({
            id: {
                type: Sequelize.INTEGER,
                primaryKey: true,
                autoIncrement: true,
                // defaultValue: 20000
            },
            siteName: {
                type: Sequelize.STRING(20),
                allowNull: false
            },
            siteTitle: {
                type: Sequelize.STRING(100),
                defaultValue: null
            },
            siteUrl: {
                type: Sequelize.STRING(255),
                allowNull: false,
                unique: true
            },
            siteDomain: {
                type: Sequelize.STRING(100),
                allowNull: false
            },
        }, {
            sequelize,  // static initiate 메서드의 배개변수와 연결되는 옵션
            timestamps: false, // true로 할 경우 시퀄라이즈는 createAt과 updateAt 컬럼을 자동으로 추가한다. 
            underscored: true, // 기본적으로 테이블명과 컬럼명을 카멜케이스로 만들게 되는데, true로 할 경우 스네이크케이스로 바꾸는 옵션
            modelName: 'AlertSite', //모델 이름, 노드 프로젝트에서 사용
            tableName: 'alert_site', // 실제 테이블 명
            paranoid: false, // true deleteAt이라는 컬럼이 생성되며 삭제할 때 바로 지워지지 않는다. 조회시 deleteAt null인 값을 조회한다
            charset: 'utf8',
            collate: 'utf8_general_ci',
            initialAutoIncrement: 'id'
        });
    }
    static associate(db){
        // db.AlertSite.belongsTo(db.AlertSite, { foreignKey: '', tagetKey: ''})
    } // 다른 모델과의 관계
}

module.exports = AlertSite;