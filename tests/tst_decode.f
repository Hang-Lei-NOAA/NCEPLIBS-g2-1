!> This test is for decoding full grib2 message. Code was translated
!> from the C version originated from Dusan. 
!> Dusan Jovic July 2021
!>

       program tst_decode
       use grib_mod
       use g2grids
       use params
       use gridtemplates

       integer fgrib_len, iret, i
       character, dimension(195) :: fgrib
       real, dimension(121) :: fld_ok
       integer G2_ERROR, numfields, numlocal, maxlocal
       character, dimension(195) :: hex
       integer, dimension(3) :: listsec0, listsec0_ok
       integer, dimension(13) :: listsec1, listsec1_ok
       type(gribfield) :: gfld
    
       print *,"Testing decoding full grib2 message.\n"

!        read(fgrib(1:75),'(z4)')
         hex(:)=(/ 
     &  "0x47", "0x52", "0x49", "0x42", "0x00", "0x00",
     &  "0x02", "0x02", "0x00", "0x00", "0x00", "0x00",
     &  "0x00", "0x00", "0x00", "0xc3", "0x00", "0x00",
     &  "0x00", "0x15", "0x01", "0x00", "0x07", "0x00",
     &  "0x00", "0x02", "0x01", "0x01", "0x07", "0xe5",
     &  "0x07", "0x0e", "0x06", "0x00", "0x00", "0x00",
     &  "0x01", "0x00", "0x00", "0x00", "0x48", "0x03",
     &  "0x00", "0x00", "0x00", "0x00", "0x79", "0x00",
     &  "0x00", "0x00", "0x00", "0x06", "0x00", "0x00",
     &  "0x00", "0x00", "0x00", "0x00", "0x00", "0x00",
     &  "0x00", "0x00", "0x00", "0x00", "0x00", "0x00",
     &  "0x00", "0x00", "0x00", "0x00", "0x0b", "0x00",
     &  "0x00", "0x00", "0x0b", "0x00", "0x00", "0x00",
     &  "0x00", "0xff", "0xff", "0xff", "0xff", "0x01",
     &  "0xc9", "0xc3", "0x80", "0x01", "0x31", "0x2d",
     &  "0x00", "0x30", "0x02", "0x62", "0x5a", "0x00",
     &  "0x01", "0xc9", "0xc3", "0x80", "0x00", "0x0f",
     &  "0x42", "0x40", "0x00", "0x0f", "0x42", "0x40",
     &  "0x40", "0x00", "0x00", "0x00", "0x22", "0x04",
     &  "0x00", "0x00", "0x00", "0x00", "0x00", "0x00",
     &  "0x02", "0x00", "0x60", "0x00", "0x00", "0x00",
     &  "0x01", "0x00", "0x00", "0x00", "0x06", "0x01",
     &  "0x00", "0x00", "0x00", "0x00", "0x00", "0xff",
     &  "0x00", "0x00", "0x00", "0x00", "0x00", "0x00",
     &  "0x00", "0x00", "0x15", "0x05", "0x00", "0x00",
     &  "0x00", "0x79", "0x00", "0x00", "0x00", "0x00",
     &  "0x00", "0x00", "0x00", "0x00", "0x00", "0x00",
     &  "0x01", "0x00", "0x00", "0x00", "0x00", "0x06",
     &  "0x06", "0xff", "0x00", "0x00", "0x00", "0x15",
     &  "0x07", "0xff", "0xef", "0xf7", "0xe0", "0x00",
     &  "0x00", "0x00", "0x08", "0x00", "0x01", "0x83",
     &  "0x38", "0xee", "0x3f", "0xa7", "0x80", "0x37",
     &  "0x37", "0x37", "0x37" /)
       read(fgrib(1:195),'(195z4)')hex(1:195)      
        fgrib_len = 195
        G2_ERROR = 2
       listsec0_ok(:) = (/ 2, 2, 195 /)
       listsec1_ok(:) = (/ 7, 0, 2, 1, 1, 2021, 7, 14, 6, 0, 0, 0, 1 /)

       fld_ok(:) = (/
     &  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
     &  0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1,
     &  1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
     &  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     &  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     &  0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
     &  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     &  0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 1,
     &  0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1,
     &  0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1,
     &  1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 1 /)
       
 
        call gb_info(fgrib, fgrib_len, listsec0, listsec1,
     &  numfields, numlocal, maxlocal, iret)
       if (iret .ne. 0) stop 101

       do i =0,2
         if (listsec0(i) .ne. listsec0_ok(i)) stop 102
       end do

       do i =0,12
         if (listsec1(i) .ne. listsec1_ok(i)) stop 103
       end do

       if (numfields .ne. 1) stop 104
       if (numlocal .ne. 0)  stop 105

       call gf_getfld(fgrib, fgrib_len, 1, 1, 1, gfld, iret)
       if (iret .ne. 0) stop 106

       if (gfld%version .ne. 2) stop 107

       if (gfld%ndpts .ne. 121) stop 108

       do i =0,(gfld%ndpts-1) 
        if (gfld%fld(i) .ne. fld_ok(i)) stop 109
       end do

       call gf_free(gfld)

       print *,"SUCCESS!\n"
       
       end program tst_decode
