

uniform float uSize;
uniform float uTime;

attribute float aScale;
attribute vec3 aRandomness;
varying vec3 vColor;




void main()
{


    //POSITION 

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    //SPIN
    float angle = atan(modelPosition.x, modelPosition.z);
    float distanceToCenter = length(modelPosition.xz);
    float angleOffset = (1.0 / distanceToCenter) * uTime * 0.2;
    angle += angleOffset;
    modelPosition.x = cos(angle) * distanceToCenter;
    modelPosition.z = sin(angle) * distanceToCenter;

    //RANDOMNESSS

    modelPosition.xyz += aRandomness;
    


    

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

        gl_Position = projectedPosition;

        //POSITION

        gl_PointSize = uSize * aScale;
        gl_PointSize *= ( 1.0 / - viewPosition.z );

        

        //COLOR

        vColor = color;




               
                

}



