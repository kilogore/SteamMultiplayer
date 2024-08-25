function approach(startpoint, endpoint, increment) {
/*
APPROACH

Returns 0 shifted toward 1 by 2, without crossing 0.
Note that if argument2 is negative, you will move AWAY from 0.
Ex:
approach( 5, 0, 2 )     = 3
approach( -5, 0, 2 )    =-3
approach( 1, 0, 1 )     = 0
approach( 1, 0, 2 )     = 0
*/

if ( startpoint < endpoint )
    return min( startpoint+increment, endpoint );
else
    return max( startpoint-increment, endpoint );

}
