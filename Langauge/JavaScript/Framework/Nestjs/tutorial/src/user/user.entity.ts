import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  @Column('MEMBER_CODE')
  memberCode: number;

  @Column('MEMBER_PWD')
  memberPwd: string;

  @Column('MEMBER_NAME')
  memberName: string;

  @Column('MEMBER_ID')
  memberId: string;

  @Column('MEMBER_EMAIL')
  memberEmail: string;

  @Column('MEMBER_PHONE')
  memberPhone: string;

  @Column('MEMBER_NO')
  memberNo: string;

  @Column('MEMBER_STATUS')
  memberStatus: string;

  @Column('EXTENSION_NUMBER')
  extensionNumber: string;

  @Column('MEMBER_ADDRESS')
  memberAddress: string;

  @Column('HIRE_DATE')
  hireDate: Date;

  @Column('DEPT_CODE')
  deptCode: number;

  @Column('MEMBER_PIC')
  memberPic: string;

  @Column('RANK_CODE')
  rankCode: number;

  @Column('MEMBER_OFF')
  memberOff: number;

  @Column('MEMBER_PIC_ORIGIN')
  memberPicOrigin: string;
}
