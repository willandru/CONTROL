/**
  @Generated Pin Manager Header File

  @Company:
    Microchip Technology Inc.

  @File Name:
    pin_manager.h

  @Summary:
    This is the Pin Manager file generated using PIC10 / PIC12 / PIC16 / PIC18 MCUs

  @Description
    This header file provides APIs for driver for .
    Generation Information :
        Product Revision  :  PIC10 / PIC12 / PIC16 / PIC18 MCUs - 1.81.8
        Device            :  PIC16F1827
        Driver Version    :  2.11
    The generated drivers are tested against the following:
        Compiler          :  XC8 2.36 and above
        MPLAB 	          :  MPLAB X 6.00	
*/

/*
    (c) 2018 Microchip Technology Inc. and its subsidiaries. 
    
    Subject to your compliance with these terms, you may use Microchip software and any 
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party 
    license terms applicable to your use of third party software (including open source software) that 
    may accompany Microchip software.
    
    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER 
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY 
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS 
    FOR A PARTICULAR PURPOSE.
    
    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, 
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND 
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP 
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO 
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL 
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT 
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS 
    SOFTWARE.
*/

#ifndef PIN_MANAGER_H
#define PIN_MANAGER_H

/**
  Section: Included Files
*/

#include <xc.h>

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set RA3 procedures
#define RA3_SetHigh()            do { LATAbits.LATA3 = 1; } while(0)
#define RA3_SetLow()             do { LATAbits.LATA3 = 0; } while(0)
#define RA3_Toggle()             do { LATAbits.LATA3 = ~LATAbits.LATA3; } while(0)
#define RA3_GetValue()              PORTAbits.RA3
#define RA3_SetDigitalInput()    do { TRISAbits.TRISA3 = 1; } while(0)
#define RA3_SetDigitalOutput()   do { TRISAbits.TRISA3 = 0; } while(0)
#define RA3_SetAnalogMode()         do { ANSELAbits.ANSA3 = 1; } while(0)
#define RA3_SetDigitalMode()        do { ANSELAbits.ANSA3 = 0; } while(0)

// get/set RB1 procedures
#define RB1_SetHigh()            do { LATBbits.LATB1 = 1; } while(0)
#define RB1_SetLow()             do { LATBbits.LATB1 = 0; } while(0)
#define RB1_Toggle()             do { LATBbits.LATB1 = ~LATBbits.LATB1; } while(0)
#define RB1_GetValue()              PORTBbits.RB1
#define RB1_SetDigitalInput()    do { TRISBbits.TRISB1 = 1; } while(0)
#define RB1_SetDigitalOutput()   do { TRISBbits.TRISB1 = 0; } while(0)
#define RB1_SetPullup()             do { WPUBbits.WPUB1 = 1; } while(0)
#define RB1_ResetPullup()           do { WPUBbits.WPUB1 = 0; } while(0)
#define RB1_SetAnalogMode()         do { ANSELBbits.ANSB1 = 1; } while(0)
#define RB1_SetDigitalMode()        do { ANSELBbits.ANSB1 = 0; } while(0)

// get/set CH_B aliases
#define CH_B_TRIS                 TRISBbits.TRISB3
#define CH_B_LAT                  LATBbits.LATB3
#define CH_B_PORT                 PORTBbits.RB3
#define CH_B_WPU                  WPUBbits.WPUB3
#define CH_B_ANS                  ANSELBbits.ANSB3
#define CH_B_SetHigh()            do { LATBbits.LATB3 = 1; } while(0)
#define CH_B_SetLow()             do { LATBbits.LATB3 = 0; } while(0)
#define CH_B_Toggle()             do { LATBbits.LATB3 = ~LATBbits.LATB3; } while(0)
#define CH_B_GetValue()           PORTBbits.RB3
#define CH_B_SetDigitalInput()    do { TRISBbits.TRISB3 = 1; } while(0)
#define CH_B_SetDigitalOutput()   do { TRISBbits.TRISB3 = 0; } while(0)
#define CH_B_SetPullup()          do { WPUBbits.WPUB3 = 1; } while(0)
#define CH_B_ResetPullup()        do { WPUBbits.WPUB3 = 0; } while(0)
#define CH_B_SetAnalogMode()      do { ANSELBbits.ANSB3 = 1; } while(0)
#define CH_B_SetDigitalMode()     do { ANSELBbits.ANSB3 = 0; } while(0)

// get/set OUT7 aliases
#define OUT7_TRIS                 TRISBbits.TRISB4
#define OUT7_LAT                  LATBbits.LATB4
#define OUT7_PORT                 PORTBbits.RB4
#define OUT7_WPU                  WPUBbits.WPUB4
#define OUT7_ANS                  ANSELBbits.ANSB4
#define OUT7_SetHigh()            do { LATBbits.LATB4 = 1; } while(0)
#define OUT7_SetLow()             do { LATBbits.LATB4 = 0; } while(0)
#define OUT7_Toggle()             do { LATBbits.LATB4 = ~LATBbits.LATB4; } while(0)
#define OUT7_GetValue()           PORTBbits.RB4
#define OUT7_SetDigitalInput()    do { TRISBbits.TRISB4 = 1; } while(0)
#define OUT7_SetDigitalOutput()   do { TRISBbits.TRISB4 = 0; } while(0)
#define OUT7_SetPullup()          do { WPUBbits.WPUB4 = 1; } while(0)
#define OUT7_ResetPullup()        do { WPUBbits.WPUB4 = 0; } while(0)
#define OUT7_SetAnalogMode()      do { ANSELBbits.ANSB4 = 1; } while(0)
#define OUT7_SetDigitalMode()     do { ANSELBbits.ANSB4 = 0; } while(0)

// get/set OUT2 aliases
#define OUT2_TRIS                 TRISBbits.TRISB5
#define OUT2_LAT                  LATBbits.LATB5
#define OUT2_PORT                 PORTBbits.RB5
#define OUT2_WPU                  WPUBbits.WPUB5
#define OUT2_ANS                  ANSELBbits.ANSB5
#define OUT2_SetHigh()            do { LATBbits.LATB5 = 1; } while(0)
#define OUT2_SetLow()             do { LATBbits.LATB5 = 0; } while(0)
#define OUT2_Toggle()             do { LATBbits.LATB5 = ~LATBbits.LATB5; } while(0)
#define OUT2_GetValue()           PORTBbits.RB5
#define OUT2_SetDigitalInput()    do { TRISBbits.TRISB5 = 1; } while(0)
#define OUT2_SetDigitalOutput()   do { TRISBbits.TRISB5 = 0; } while(0)
#define OUT2_SetPullup()          do { WPUBbits.WPUB5 = 1; } while(0)
#define OUT2_ResetPullup()        do { WPUBbits.WPUB5 = 0; } while(0)
#define OUT2_SetAnalogMode()      do { ANSELBbits.ANSB5 = 1; } while(0)
#define OUT2_SetDigitalMode()     do { ANSELBbits.ANSB5 = 0; } while(0)

/**
   @Param
    none
   @Returns
    none
   @Description
    GPIO and peripheral I/O initialization
   @Example
    PIN_MANAGER_Initialize();
 */
void PIN_MANAGER_Initialize (void);

/**
 * @Param
    none
 * @Returns
    none
 * @Description
    Interrupt on Change Handling routine
 * @Example
    PIN_MANAGER_IOC();
 */
void PIN_MANAGER_IOC(void);



#endif // PIN_MANAGER_H
/**
 End of File
*/