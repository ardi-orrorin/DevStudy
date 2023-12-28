import { styled } from 'styled-components';

const Nesting = () => {

    const Thing = styled.div.attrs(props => ({
        tabIndex: 0
    }))`
        color: blue;

        &:hover {
            color: red;
        }
        & ~ & {
            background: tomato; // 형재 요소의 형제 요소
        }

        & + & {
            background: lime; // 현재 요소의 형제 요소
        }
        &.something {
            background: orange; // .something 클래스를 가진 현재 요소
        }
        .something-else & {
            border: 1px solid; // .something-else 클래스를 가진 현재 요소의 자식 요소
        }
    `;

    const Input = styled.input.attrs({type: 'checkbox'})``;

    const Label = styled.label`
        display: flex;
        align-items: center;
        gap: 8px;
        margin-bottom: 8px;
    `;
    
    // && 는 컴포넌트 인스턴수를 나타낸다.
    // 스타일 오버라이드를 수행하면서 특정 컴포넌트의 모든 인스턴스에 스타일을 적용하지 않으려는 경우에 유용
    const LabelText = styled.span`
        ${props => {
            switch (props.$mode) {
                case 'dark':
                    return `
                        background: black;
                        color: white;
                        ${Input}:checked + && {
                            color: blue;
                        }
                    `;
                default:
                    return `
                        background: white;
                        color: black;
                        ${Input}:checked + && {
                            color: red;
                        }
                    `;
            }
        }}     
    `;

    return (
        <>
            <Thing>Hello world!</Thing>
            <Thing>How ya doing?</Thing>
            <Thing className="something">The sun is shining...</Thing>
            <div>Pretty nice day today.</div>
            <Thing>Don't you think?</Thing>
            <div className="something-else">
                <Thing>Splendid.</Thing>
            </div>
            <Label>
                <Input />
                <LabelText>Light</LabelText>
            </Label>
            <Label>
                <Input/>
                <LabelText $mode='dark'>Light</LabelText>
            </Label>
        </>
    )
}

export default Nesting;