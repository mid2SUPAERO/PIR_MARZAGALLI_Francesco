$
$ SPEEDS (EAS):
$ - Maneuvering          VA:  141.297 [m/s].
$ - Rough air            VB:  -1 [m/s].
$ - Design cruise        VC:  231.4 [m/s].
$ - Design dive          VD:  289.25 [m/s].
$ - Stall clean conf.    VS:  89.3639 [m/s].
$ - Stall landing conf. VFLAND: -1 [m/s].
$      Percentage MTOW used: 79.1%
$ - Flap design          VF:  -1 [m/s].
$
$ MACH:
$ - Design cruise MMO:  0.712.
$ - Design dive    MD:  0.89.
$
$ LOAD FACTORS:
$ - Max nz: 2.5.
$ - Min nz: -1.
$
$ REFERENCE DATA used:
$ - Design weight: 838186 [N]
$ - Reference surface: 122.4 [m^2]
$ - Reference chord: 3.58944 [m]
$ - Reference span: 34.1 [m]
$ - Max ceiling altitude: 11900 [m]
$ - User-defined reference surface for CLMAX, CLMAXLAND, CLALPHAD: 122.4 [m^2]
$
TRIM=   1
$ Sec. 25.331
$ Maximum load factor at VD, nz = 2.5, z=0m
$ VD: 289.182 m/s
$ Determine pitch control and angle of attack
TRIM    1       1       0.8499040.0     SIDES   0.0     ROLL    0.0     
        PITCH   0.000315YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     URDD5   0.0     URDD6   0.0     CLIMB   0.0     
        BANK    0.0     HEAD    0.0     URDD3   24.525  aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   2
$ Sec. 25.331
$ Maximum load factor at VD, nz = 2.5, z=770m
$ VD: 300.162 m/s
$ Determine pitch control and angle of attack
TRIM    2       1       0.89    770     SIDES   0.0     ROLL    0.0     
        PITCH   0.000293YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     URDD5   0.0     URDD6   0.0     CLIMB   0.0     
        BANK    0.0     HEAD    0.0     URDD3   24.525  aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   3
$ Sec. 25.331
$ Maximum load factor at VC, nz = 2.5, z=0m
$ VC: 231.345 m/s
$ Determine pitch control and angle of attack
TRIM    3       1       0.6799230.0     SIDES   0.0     ROLL    0.0     
        PITCH   0.000493YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     URDD5   0.0     URDD6   0.0     CLIMB   0.0     
        BANK    0.0     HEAD    0.0     URDD3   24.525  aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   4
$ Sec. 25.331
$ Maximum load factor at VC, nz = 2.5, z=770m
$ VC: 240.13 m/s
$ Determine pitch control and angle of attack
TRIM    4       1       0.712   770     SIDES   0.0     ROLL    0.0     
        PITCH   0.000458YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     URDD5   0.0     URDD6   0.0     CLIMB   0.0     
        BANK    0.0     HEAD    0.0     URDD3   24.525  aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   5
$ Sec. 25.331 b1
$ Sudden aft movement of pitch control at VA=sqrt(nmax) * VS , z=0m
$  VA: 141.297 m/s
$  VS: 89.3639 m/s
$ Determine pitch control and angle of attack
$ Check control deflection is between -25 and 25
TRIM    5       1       0.4152120.0     SIDES   0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     BANK    0.0     URDD6   0.0     CLIMB   0.0     
        HEAD    0.0     URDD3   9.81    URDD5   0.354985aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   6
$ Sec. 23.331 b1
$ Sudden aft movement of pitch control at VC, z=0m
$  VC: 231.345 m/s
$ Determine pitch control and angle of attack
$ Check control deflection is between -25 and 25
TRIM    6       1       0.6799230.0     SIDES   0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     BANK    0.0     URDD6   0.0     CLIMB   0.0     
        HEAD    0.0     URDD3   9.81    URDD5   0.21676 aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   7
$ Sec. 23.331 b1
$ Sudden aft movement of pitch control at VD, z=0m
$  VD: 289.182 m/s
$ Determine pitch control and angle of attack
$ Check control deflection is between -25 and 25
TRIM    7       1       0.8499040.0     SIDES   0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     BANK    0.0     URDD6   0.0     CLIMB   0.0     
        HEAD    0.0     URDD3   9.81    URDD5   0.173408aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   8
$ Sec. 25.331 b1
$ Sudden aft movement of pitch control at VA=sqrt(nmax) * VS , z=0m
$  VA: 141.297 m/s
$  VS: 89.3639 m/s
$ Determine pitch control and angle of attack
$ Check control deflection is between -25 and 25
TRIM    8       1       0.4152120.0     SIDES   0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     BANK    0.0     URDD6   0.0     CLIMB   0.0     
        HEAD    0.0     URDD3   24.525  URDD5   -0.35498aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   9
$ Sec. 23.331 b1
$ Sudden aft movement of pitch control at VC, z=0m
$  VC: 231.345 m/s
$ Determine pitch control and angle of attack
$ Check control deflection is between -25 and 25
TRIM    9       1       0.6799230.0     SIDES   0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     BANK    0.0     URDD6   0.0     CLIMB   0.0     
        HEAD    0.0     URDD3   24.525  URDD5   -0.21676aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   10
$ Sec. 23.331 b1
$ Sudden aft movement of pitch control at VD, z=0m
$  VD: 289.182 m/s
$ Determine pitch control and angle of attack
$ Check control deflection is between -25 and 25
TRIM    10      1       0.8499040.0     SIDES   0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     URDD2   0.0     THRUST  0.0     
        URDD4   0.0     BANK    0.0     URDD6   0.0     CLIMB   0.0     
        HEAD    0.0     URDD3   24.525  URDD5   -0.17340aileronr0       
        flap1r  0       flap2r  0       rudder1 0       
TRIM=   11
$ Sec. 25.351 a
$ Sideslip maneuver at max rudder deflection at VA=sqrt(nmax) * VS, z=0m
$  VA: 141.297 m/s
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    11      0       0.4152120.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   0.0     THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 30      
TRIM=   12
$ Sec. 25.351 b
$ Sideslip maneuver at overswing sideslip angle 22.5 deg at VA=sqrt(nmax) * VS, z=0m
$  VA: 141.297 m/s
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    12      0       0.4152120.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   22.5    THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 30      
TRIM=   13
$ Sec. 25.351 c
$ Sideslip maneuver at sideslip angle 15 at VA=sqrt(nmax) * VS, z=0m
$  VA: 141.297 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    13      0       0.4152120.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   15      THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 0       
TRIM=   14
$ Sec. 25.351 a
$ Sideslip maneuver at max rudder deflection at VS, z=0m
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    14      0       0.2626030.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   0.0     THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 30      
TRIM=   15
$ Sec. 25.351 b
$ Sideslip maneuver at overswing sideslip angle 22.5 deg at VS, z=0m
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    15      0       0.2626030.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   22.5    THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 30      
TRIM=   16
$ Sec. 25.351 c
$ Sideslip maneuver at sideslip angle 15 at VS, z=0m
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    16      0       0.2626030.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   15      THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 0       
TRIM=   17
$ Sec. 25.351 a
$ Sideslip maneuver at max rudder deflection at VA=sqrt(nmax) * VS, z=0m
$  VA: 141.297 m/s
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    17      0       0.4152120.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   0.0     THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 -30     
TRIM=   18
$ Sec. 25.351 b
$ Sideslip maneuver at overswing sideslip angle -22.5 deg at VA=sqrt(nmax) * VS, z=0m
$  VA: 141.297 m/s
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    18      0       0.4152120.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   -22.5   THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 -30     
TRIM=   19
$ Sec. 25.351 c
$ Sideslip maneuver at sideslip angle -15 at VA=sqrt(nmax) * VS, z=0m
$  VA: 141.297 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    19      0       0.4152120.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   -15     THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 0       
TRIM=   20
$ Sec. 25.351 a
$ Sideslip maneuver at max rudder deflection at VS, z=0m
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    20      0       0.2626030.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   0.0     THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 -30     
TRIM=   21
$ Sec. 25.351 b
$ Sideslip maneuver at overswing sideslip angle -22.5 deg at VS, z=0m
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    21      0       0.2626030.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   -22.5   THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 -30     
TRIM=   22
$ Sec. 25.351 c
$ Sideslip maneuver at sideslip angle -15 at VS, z=0m
$  VS: 89.3639 m/s
$ Determine pitch control, angle of attack, lateral acceleration, roll and yaw accelerations
TRIM    22      0       0.2626030.0     HEAD    0.0     ROLL    0.0     
        PITCH   0.0     YAW     0.0     SIDES   -15     THRUST  0.0     
        BANK    0.0     CLIMB   0.0     URDD5   0.0     URDD3   9.81    
        aileronr0       flap1r  0       flap2r  0       rudder1 0       
ITRIM= 1       
ITRIM= 2       
ITRIM= 3       
ITRIM= 4       
ITRIM= 5       
ITRIM= 3       
ITRIM= 1       
ITRIM= 5       
ITRIM= 3       
ITRIM= 1       
ITRIM= 5       
ITRIM= 5       
ITRIM= 5       
ITRIM= 6       
ITRIM= 6       
ITRIM= 6       
ITRIM= 5       
ITRIM= 5       
ITRIM= 5       
ITRIM= 6       
ITRIM= 6       
ITRIM= 6       