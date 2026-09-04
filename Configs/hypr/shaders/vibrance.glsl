#version 300 es
precision highp float;
in vec2 v_texcoord;
layout(location = 0) out vec4 fragColor;
uniform sampler2D tex;

// --- TWEAK THIS VALUE ---
// 0.0 is native/no change. 
// 0.3 is a cinematic boost for survival horror.
// 0.5+ will look extremely saturated.
const float VIBRANCE = 0.7; 

void main() {
    // Sample the current pixel's color
    vec4 color = texture(tex, v_texcoord);

    // Calculate the luminance (perceived brightness) of the pixel
    float luminance = dot(color.rgb, vec3(0.299, 0.587, 0.114));

    // Find the strongest and weakest color channels
    float max_color = max(color.r, max(color.g, color.b));
    float min_color = min(color.r, min(color.g, color.b));

    // Determine how saturated the pixel currently is
    float color_saturation = max_color - min_color;

    // Apply the vibrance shift
    color.rgb = mix(vec3(luminance), color.rgb, 1.0 + (VIBRANCE * (1.0 - color_saturation)));

    // Output the final adjusted color
    fragColor = color;
}
