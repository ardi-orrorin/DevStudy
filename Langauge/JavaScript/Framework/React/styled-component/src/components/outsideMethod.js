import { styled } from 'styled-components';
import { useState } from 'react';

const OutsideMethod = () => {
    const [count, setCount] = useState(0);

    // 정상적인 방법
    const StyledWrapper = styled.div`
        width: 100%;
        background-color: red;
        color: white;
    `;

    const WrapperComponent = ({ children }) => {
        return <StyledWrapper>{ children }</StyledWrapper>
    };

    // 잘못된 방법
    // 상태변경이나 DOM이 재렌더링이 될 때 스타일 또한 다시 생성된다.
   
    const AlongWrapper = ({ children }) => {
        console.log('AlongWrapper rendering');
        // sytled Component가 렌더링 될 때마다 새로운 스타일 컴포넌트가 생성된다.
        const StyledAlongWrapper = styled.div`
            width: 100%;
            background-color: red;
            color: white;
        `;
        return <StyledAlongWrapper>{ children }</StyledAlongWrapper>
    }

    return (
        <>
            <div>OutsideMethod</div>
            <StyledWrapper>OutsideMethod</StyledWrapper>
            <WrapperComponent>정상적인 스타일 컴포넌트 생성방법</WrapperComponent>
            <AlongWrapper>잘못된 스타일 컴포넌트 생성방법</AlongWrapper>
            <div>count: { count }</div>
            <button onClick={ () => setCount(count + 1) }>count + 1</button>
        </>
    )
}

export default OutsideMethod;