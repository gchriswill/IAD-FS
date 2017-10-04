package gchriswill.me.iad_1508_lab9_androidtv;

import java.util.ArrayList;
import java.util.List;

public final class MovieList {

    public static final String MOVIE_CATEGORY[] = {
            "Microsoft 2015",
            "Apple 2015",
            "Google 2015"
    };

    public static final String MOVIE_STUDIO[] = {
            "Microsoft Studios",
            "Apple Studios",
            "Google Studios"
    };

    public static List<Movie> list;

    public static List<Movie> setupMicrosoftMovies() {

        list = new ArrayList<Movie>();

        String title[] = {
                "W10 + GMUNK + Odesza",
                "Windows 10",
                "Microsoft Edge",
                "Microsoft HoloLens",
                "Devs Who Do"
        };

        String description[] = {
                "The making of video of the Windows 10 Logo. " +
                        "This was a collaboration between GMUNK Lighting artist and Odesza music artist.",

                "The video reveal of Windows 10. This video was intendent to inspire the windows user fan base.",

                "The video featurette of Microsoft Edge. This browser was developed by Microsoft to take a new " +
                        "approach for starting from scratch to take a second chance in the web browser market after " +
                        "the IE Failures.",

                "The reveal video of Microsoft HoloLens. This video showcases some of the capabilities of the device and " +
                        "its integrations with Microsoft services.",

                "The video featurette for the Microsoft's Windows developers. This video showcases the developers behind " +
                        "the code."
        };

        String videoUrl[] = {
                "https://s3.amazonaws.com/iadlab9videos/microsoft/videos/W10Logo.mp4",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/videos/W10Reveal.mp4",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/videos/Edge.mp4",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/videos/Holo.mp4",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/videos/DOD.mp4"
        };

        String bgImageUrl[] = {
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/background/W10Logo.jpg",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/background/W10Reveal.jpg",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/background/Edge.png",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/background/Holo.png",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/background/DOD.png",
        };

        String cardImageUrl[] = {
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/card/W10Logo.png",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/card/W10Reveal.png",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/card/Edge.png",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/card/Holo.png",
                "https://s3.amazonaws.com/iadlab9videos/microsoft/images/card/DOD.png"
        };

        for (int i = 0; i < 5; i++){

            list.add( buildMovieInfo(MOVIE_CATEGORY[0], title[i], description[i], MOVIE_STUDIO[0], videoUrl[i],
                    cardImageUrl[i], bgImageUrl[i] ) );

        }

        return list;

    }

    public static List<Movie> setupAppleMovies() {

        list = new ArrayList<Movie>();

        String title[] = {
                "The Apple Watch",
                "We are BETTER",
                "The All New Macbook",
                "Different Perspectives",
                "The App Effect"
        };

        String description[] = {
                "The Apple Watch reveal video. This video was released on the Apple March event on 2015.",
                "The Better everything of Apple. This video represent the approach of Apple for creating products.",
                "The Macbook 2015 reveal video. This video was released on the Apple March event on 2015.",
                "The diferent Apple perspectives. This video represent the original culture of Apple \"Think Different\".",
                "The Effect the App Store and all its app had made in the digital mobile ecosystem."
        };

        String videoUrl[] = {
                "https://s3.amazonaws.com/iadlab9videos/apple/videos/AppleWatchReveal.mp4",
                "https://s3.amazonaws.com/iadlab9videos/apple/videos/Better.mp4",
                "https://s3.amazonaws.com/iadlab9videos/apple/videos/MacbookReveal.mp4",
                "https://s3.amazonaws.com/iadlab9videos/apple/videos/Perspective.mp4",
                "https://s3.amazonaws.com/iadlab9videos/apple/videos/TheAppEffect.mp4"
        };

        String bgImageUrl[] = {
                "https://s3.amazonaws.com/iadlab9videos/apple/images/background/AppleWatchReveal.png",
                "https://s3.amazonaws.com/iadlab9videos/apple/images/background/Better.png",
                "https://s3.amazonaws.com/iadlab9videos/apple/images/background/MacbookReveal.png",
                "https://s3.amazonaws.com/iadlab9videos/apple/images/background/Perspective.png",
                "https://s3.amazonaws.com/iadlab9videos/apple/images/background/TheAppEffect.png"
        };

        String cardImageUrl[] = {
                "https://s3.amazonaws.com/iadlab9videos/apple/images/card/AppleWatchReveal.png",
                "https://s3.amazonaws.com/iadlab9videos/apple/images/card/Better.png",
                "https://s3.amazonaws.com/iadlab9videos/apple/images/card/MacbookReveal.png",
                "https://s3.amazonaws.com/iadlab9videos/apple/images/card/Perspective.png",
                "https://s3.amazonaws.com/iadlab9videos/apple/images/card/TheAppEffect.png"
        };

        for (int i = 0; i < 5; i++){

            list.add( buildMovieInfo(MOVIE_CATEGORY[1], title[i], description[i], MOVIE_STUDIO[1], videoUrl[i],
                    cardImageUrl[i], bgImageUrl[i] ) );

        }

        return list;

    }

    public static List<Movie> setupGoogleMovies() {

        list = new ArrayList<Movie>();

        String title[] = {
                "The All New Nexus 6",
                "The All New Nexus 9",
                "Introducing Photos",
                "Project FI",
                "Year In Search 2014"
        };

        String description[] = {
                "The video featurette of the Nexus 6. This video showcases the design and flagship features of the device.",
                "The video featurette of the Nexus 9. This video showcases the design and flagship features of the device.",
                "The video of the new Google's Photos service campaign.",
                "The vide of the new Google's upcomming service \"Project FI\".",
                "The video featurette that represents the most interesting Google searches in 2014."
        };

        String videoUrl[] = {
                "https://s3.amazonaws.com/iadlab9videos/google/videos/Nexus6.mp4",
                "https://s3.amazonaws.com/iadlab9videos/google/videos/Nexus9.mp4",
                "https://s3.amazonaws.com/iadlab9videos/google/videos/Photos.mp4",
                "https://s3.amazonaws.com/iadlab9videos/google/videos/ProjectFi.mp4",
                "https://s3.amazonaws.com/iadlab9videos/google/videos/YearInSearch2014.mp4"
        };

        String bgImageUrl[] = {
                "https://s3.amazonaws.com/iadlab9videos/google/images/background/Nexus6.png",
                "https://s3.amazonaws.com/iadlab9videos/google/images/background/Nexus9.png",
                "https://s3.amazonaws.com/iadlab9videos/google/images/background/Photos.png",
                "https://s3.amazonaws.com/iadlab9videos/google/images/background/ProjectFi.png",
                "https://s3.amazonaws.com/iadlab9videos/google/images/background/YearInSearch2014.png"
        };

        String cardImageUrl[] = {
                "https://s3.amazonaws.com/iadlab9videos/google/images/card/Nexus6.png",
                "https://s3.amazonaws.com/iadlab9videos/google/images/card/Nexus9.png",
                "https://s3.amazonaws.com/iadlab9videos/google/images/card/Photos.png",
                "https://s3.amazonaws.com/iadlab9videos/google/images/card/ProjectFi.png",
                "https://s3.amazonaws.com/iadlab9videos/google/images/card/YearInSearch2014.png"
        };

        for (int i = 0; i < 5; i++){

            list.add( buildMovieInfo(MOVIE_CATEGORY[2], title[i], description[i], MOVIE_STUDIO[2], videoUrl[i],
                    cardImageUrl[i], bgImageUrl[i] ) );

        }

        return list;

    }

    private static Movie buildMovieInfo(String category, String title, String description, String studio, String videoUrl,
                                        String cardImageUrl, String bgImageUrl) {

        Movie movie = new Movie();
        movie.setId( Movie.getCount());
        Movie.incCount();
        movie.setTitle(title);
        movie.setDescription(description);
        movie.setStudio(studio);
        movie.setCategory(category);
        movie.setCardImageUrl(cardImageUrl);
        movie.setBackgroundImageUrl(bgImageUrl);
        movie.setVideoUrl(videoUrl);

        return movie;

    }
}
