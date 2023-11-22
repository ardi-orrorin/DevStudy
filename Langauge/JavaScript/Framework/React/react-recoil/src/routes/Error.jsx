import styles from '../scss/pages/_loading.module.scss';

export default function ErrorPage() {
    const code = 1000;
    const message = '에러가 발생했습니다.';

    console.log(code, message);

    return (
        <div className={styles.container}>
            <h1>{code}</h1>
            <p>{message}</p>
        </div>
    )

}