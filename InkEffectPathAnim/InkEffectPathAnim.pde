import com.thomasdiewald.pixelflow.java.*;
import com.thomasdiewald.pixelflow.java.accelerationstructures.*;
import com.thomasdiewald.pixelflow.java.antialiasing.FXAA.*;
import com.thomasdiewald.pixelflow.java.antialiasing.GBAA.*;
import com.thomasdiewald.pixelflow.java.antialiasing.SMAA.*;
import com.thomasdiewald.pixelflow.java.dwgl.*;
import com.thomasdiewald.pixelflow.java.flowfieldparticles.*;
import com.thomasdiewald.pixelflow.java.fluid.*;
import com.thomasdiewald.pixelflow.java.geometry.*;
import com.thomasdiewald.pixelflow.java.imageprocessing.*;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.*;
import com.thomasdiewald.pixelflow.java.render.skylight.*;
import com.thomasdiewald.pixelflow.java.rigid_origami.*;
import com.thomasdiewald.pixelflow.java.sampling.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.constraint.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.particle.*;
import com.thomasdiewald.pixelflow.java.softbodydynamics.softbody.*;
import com.thomasdiewald.pixelflow.java.utils.*;
import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.fluid.DwFluid2D;
import com.thomasdiewald.pixelflow.java.fluid.DwFluidParticleSystem2D;
import com.thomasdiewald.pixelflow.java.dwgl.DwGLSLProgram;
import processing.core.*;
import processing.opengl.PGraphics2D;

// fluid simulation
DwFluid2D fluid;

// render target
PGraphics2D pg_fluid;


JSONArray keyFrames;

public void setup() {
  size(1920, 1080, P2D);
  frameRate(30);
  keyFrames = loadJSONArray("keyFrame.json");

  // library context
  DwPixelFlow context = new DwPixelFlow(this);

  // fluid simulation
  fluid = new DwFluid2D(context, width, height, 1);

  // some fluid parameters
  fluid.param.dissipation_velocity = 0.70f;
  fluid.param.dissipation_density  = 0.99f;

  // adding data to the fluid simulation
  fluid.addCallback_FluiData(new  DwFluid2D.FluidData() {
    public void update(DwFluid2D fluid) {
      if (frameCount >=keyFrames.size()) {
      } else {
        JSONArray pos = keyFrames.getJSONArray(frameCount);
        int posX = pos.getInt(0);
        int posY = pos.getInt(1);
        JSONArray pPos = keyFrames.getJSONArray(frameCount-1);
        int pPosX = pPos.getInt(0);
        int pPosY = pPos.getInt(1);
        println(frameCount, "::", "(x,y) =", mouseX, ",", mouseY); 

        if (posX == 0 && posY == 0) {
        } else {

          float px     = posX;
          float py     = height-posY;
          float vx     = (posX - pPosX) * +15;
          float vy     = (posY - pPosY) * -15;
          
          fluid.addVelocity(px, py, 14, vx, vy);
          fluid.addDensity (px, py, 20, 0.6f, 0.8f, 1.0f, 1.0f);
          fluid.addDensity (px, py, 8, 1.0f, 1.0f, 1.0f, 1.0f);
          fluid.addTemperature(1.0,1.0,1.0,1.0);    
        }
      }
    }
  }
  );

  pg_fluid = (PGraphics2D) createGraphics(width, height, P2D);
}

public void draw() {    
  // update simulation
  fluid.update();

  // clear render target
  pg_fluid.beginDraw();
  pg_fluid.background(0);
  pg_fluid.endDraw();

  // render fluid stuff
  fluid.renderFluidTextures(pg_fluid, 0);
  
  // display
  image(pg_fluid, 0, 0);
  saveFrame("png/img-####.png"); //image output
  //text(frameRate, 10, 10);
  //text(frameCount, 10, 30);
}
