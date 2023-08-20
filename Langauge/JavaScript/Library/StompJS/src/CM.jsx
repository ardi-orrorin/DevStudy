import styles from './cm.module.css';

const CM = ({profile, message, createDate, onClick}) => {
    return (
            <div className={styles.container} onClick={onClick}>
                <div>
                    <img src={profile}/>
                </div>
                <div>
                    <div>{message}</div>
                    <div>{createDate}</div>
                </div>

            </div>
    )
}

export default CM;